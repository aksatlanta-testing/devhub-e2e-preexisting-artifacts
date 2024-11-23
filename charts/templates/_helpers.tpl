
{{- define "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.fullname" -}}
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


{{- define "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.labels" -}}
helm.sh/chart: {{ include "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.chart" . }}
{{ include "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3ddde5b-74bf-49e2-955a-9ed07c755127.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}