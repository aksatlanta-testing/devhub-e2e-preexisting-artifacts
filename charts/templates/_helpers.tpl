
{{- define "go-echoba830b99-9e9c-4176-bf21-55d315947903.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba830b99-9e9c-4176-bf21-55d315947903.fullname" -}}
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


{{- define "go-echoba830b99-9e9c-4176-bf21-55d315947903.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba830b99-9e9c-4176-bf21-55d315947903.labels" -}}
helm.sh/chart: {{ include "go-echoba830b99-9e9c-4176-bf21-55d315947903.chart" . }}
{{ include "go-echoba830b99-9e9c-4176-bf21-55d315947903.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba830b99-9e9c-4176-bf21-55d315947903.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba830b99-9e9c-4176-bf21-55d315947903.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}