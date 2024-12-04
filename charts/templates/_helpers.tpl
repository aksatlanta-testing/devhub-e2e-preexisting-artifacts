
{{- define "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.fullname" -}}
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


{{- define "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.labels" -}}
helm.sh/chart: {{ include "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.chart" . }}
{{ include "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoada51363-51e7-4acc-85ee-e74cc98a3938.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}