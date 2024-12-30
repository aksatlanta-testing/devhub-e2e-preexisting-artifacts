
{{- define "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.fullname" -}}
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


{{- define "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.labels" -}}
helm.sh/chart: {{ include "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.chart" . }}
{{ include "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0d4870c-bf14-4485-a21d-f578fc33bc11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}