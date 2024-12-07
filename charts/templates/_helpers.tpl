
{{- define "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.fullname" -}}
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


{{- define "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.labels" -}}
helm.sh/chart: {{ include "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.chart" . }}
{{ include "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae5a107f-f43c-4ded-bfee-d5250924b81a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}