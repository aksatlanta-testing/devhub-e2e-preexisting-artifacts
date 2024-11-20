
{{- define "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.fullname" -}}
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


{{- define "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.labels" -}}
helm.sh/chart: {{ include "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.chart" . }}
{{ include "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9ca17a1-356c-42a5-b450-41a2963f35cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}