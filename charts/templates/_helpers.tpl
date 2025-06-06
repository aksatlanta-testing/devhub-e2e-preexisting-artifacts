
{{- define "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.fullname" -}}
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


{{- define "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.labels" -}}
helm.sh/chart: {{ include "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.chart" . }}
{{ include "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob078b05b-4cbf-4b95-8426-84481f4c3dad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}