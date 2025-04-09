
{{- define "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.labels" -}}
helm.sh/chart: {{ include "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.chart" . }}
{{ include "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo981ad9ab-b6bd-4668-8f4d-01d87dd307fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}