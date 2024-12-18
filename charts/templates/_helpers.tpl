
{{- define "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.fullname" -}}
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


{{- define "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.labels" -}}
helm.sh/chart: {{ include "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.chart" . }}
{{ include "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode87e0fb-3c82-43b3-855e-fd9498bc9c79.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}