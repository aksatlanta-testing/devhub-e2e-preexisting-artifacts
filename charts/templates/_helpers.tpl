
{{- define "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.fullname" -}}
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


{{- define "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.labels" -}}
helm.sh/chart: {{ include "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.chart" . }}
{{ include "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6c68a249-cbd6-45bc-b204-0c816273dd43.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}