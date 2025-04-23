
{{- define "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.fullname" -}}
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


{{- define "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.labels" -}}
helm.sh/chart: {{ include "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.chart" . }}
{{ include "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo493486f8-f65b-4a01-991b-47e42d4e613e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}