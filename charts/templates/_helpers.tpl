
{{- define "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.fullname" -}}
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


{{- define "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.labels" -}}
helm.sh/chart: {{ include "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.chart" . }}
{{ include "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob739edb7-1aab-4c28-9da5-4c943a52560a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}