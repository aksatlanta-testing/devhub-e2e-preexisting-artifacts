
{{- define "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.fullname" -}}
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


{{- define "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.labels" -}}
helm.sh/chart: {{ include "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.chart" . }}
{{ include "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a219e92-643b-4d09-9c3d-7433281b9dca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}